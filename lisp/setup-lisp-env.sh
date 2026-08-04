#!/bin/sh

set -e

rm -rf ~/quicklisp
rm -f quicklisp.lisp

wget https://beta.quicklisp.org/quicklisp.lisp || (echo "Cannot download quicklisp" >&2; exit 1)

sbcl --load quicklisp.lisp \
        --eval '(quicklisp-quickstart:install)' \
        --eval '(ql-util:without-prompting (ql:add-to-init-file))' \
        --quit \
	|| (echo "Fail to install quicklisp" >&2; exit 1)


rm -f quicklisp.lisp

sbcl --eval '(ql-dist:install-dist "http://dist.ultralisp.org/" :prompt nil)' --quit

if [ -e ~/.config/common-lisp ]; then
    cp -rp ~/.config/common-lisp ~/.config/common-lisp.bak-$(date -I)-$$
fi

mkdir -p ~/.config/common-lisp

cat <<EOF > ~/.config/common-lisp/source-registry.conf
(:source-registry
     (:tree (:home "Developer/lisp"))
     :inherit-configuration)
EOF


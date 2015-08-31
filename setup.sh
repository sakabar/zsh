#!/bin/sh

#現在の.zshrcを.zshrc.(date).bakとしてバックアップ
cp ~/.zshrc ~/.zshrc.`date "+%Y%m%d%H%M%S"`.bak

#新しい.zshrcは今までの設定に加え、~/zsh/内の設定ファイルを読み込む
echo ". ~/zsh/zshrc_main.sh" >> ~/.zshrc

#今までの設定と~/zsh/内の設定の衝突に注意してください。

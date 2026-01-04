#!/usr/bin/env zsh

# 指定路径进行fzf搜索
# ff [path]
ff() {
	fd . ${1} | fzf
}
# 指定路径进行fzf搜索, 并bat进行预览文件内容
# fb [path]
fb() {
	fd . ${1} | fzf --preview 'bat --color=always {-1}'
}
# 指定路径进行fzf搜索, 并bat进行预览文件内容, 选中回车进行vim编辑或ctrl+o开新窗口进行vim编辑
# fbv [path]
fbv() {
	fd . ${1} | fzf --preview 'bat --color=always {}' --bind 'enter:become(vim {-1})' --bind 'ctrl-o:execute:vim {-1}'
}
# 指定路径使用fzf提供交互窗口进行rg搜索, 并bat进行预览文件内容, 选中回车进行vim编辑或ctrl+o开新窗口进行vim编辑
# frv [path]
frv() {
	local target_dir=${1}
	local RELOAD="reload:rg --column --color=always --smart-case {q} $target_dir || :"
	fzf --disabled \
		--ansi \
		--bind "start:$RELOAD" \
		--bind "change:$RELOAD" \
		--bind 'enter:become:vim {1} +{2}' \
		--bind 'ctrl-o:execute:vim {1} +{2}' \
		--delimiter : \
		--preview 'bat --style=full --color=always --highlight-line {2} {1}' \
		--preview-window '~4,+{2}+4/3,<80(up)'
}

# 递归子模块 执行命令
git-sub-command() {
	local command=${1}
	if [[ -z $command ]]; then
		echo "请指定命令"
		return 1
	fi
	git submodule foreach --recursive "$command"
}
# 递归子模块 git pull rebase
git-sub-pull-rebase() {
	git-sub-command "git pull --rebase"
}
# 递归子模块 git checkout ${branch}
git-sub-switch-branch() {
	local branch=${1}
	if [[ -z $branch ]]; then
		echo "请指定分支"
		return 1
	fi
	git-sub-command "git checkout ${branch}"
}
# 递归子模块 git checkout -b ${branch} origin/${branch}
git-sub-checkout-branch() {
	local branch=${1}
	if [[ -z $branch ]]; then
		echo "请指定分支"
		return 1
	fi
	git-sub-command "git checkout -b ${branch} origin/${branch}"
}
# 递归子模块 git fetch origin ${branch}:${branch}
git-sub-fetch-origin() {
	local branch=${1}
	if [[ -z $branch ]]; then
		echo "请指定分支"
		return 1
	fi
	git-sub-command "git fetch origin ${branch}:${branch}"
}
# 递归子模块 执行命令
git-sub-command-cc() {
	local command=${1}
	if [[ -z $command ]]; then
		echo "请指定命令"
		return 1
	fi
	git submodule foreach --quiet --recursive 'echo $path' | parallel -j 8 "cd {} && echo '进入 {}' && $command"
}
# 递归子模块 git pull rebase
git-sub-pull-rebase-cc() {
	git-sub-command-cc "git pull --rebase"
}
# 递归子模块 git checkout ${branch}
git-sub-switch-branch-cc() {
	local branch=${1}
	if [[ -z $branch ]]; then
		echo "请指定分支"
		return 1
	fi
	git-sub-command-cc "git checkout ${branch}"
}
# 递归子模块 git checkout -b ${branch} origin/${branch}
git-sub-checkout-branch-cc() {
	local branch=${1}
	if [[ -z $branch ]]; then
		echo "请指定分支"
		return 1
	fi
	git-sub-command-cc "git checkout -b ${branch} origin/${branch}"
}
# 递归子模块 git fetch origin ${branch}:${branch}
git-sub-fetch-origin-cc() {
	local branch=${1}
	if [[ -z $branch ]]; then
		echo "请指定分支"
		return 1
	fi
	git-sub-command-cc "git fetch origin ${branch}:${branch}"
}

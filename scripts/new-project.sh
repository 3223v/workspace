#!/usr/bin/env bash
# 在工作区里新建一个项目骨架
# 用法: ./scripts/new-project.sh <项目名>
set -euo pipefail

name="${1:-}"
if [ -z "$name" ]; then
  echo "用法: $0 <项目名>" >&2
  exit 1
fi

if ! printf '%s' "$name" | grep -qE '^[A-Za-z0-9][A-Za-z0-9._-]*$'; then
  echo "项目名只能含字母/数字/点/下划线/连字符，且以字母或数字开头: $name" >&2
  exit 1
fi

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
dir="$root/projects/$name"

if [ -e "$dir" ]; then
  echo "已存在: projects/$name" >&2
  exit 1
fi

mkdir -p "$dir/notes"
{
  echo "# $name"
  echo
  echo "- 创建时间: $(date '+%Y-%m-%d')"
  echo "- 用途:"
  echo
  echo "## 怎么跑"
  echo
  echo '```bash'
  echo
  echo '```'
  echo
  echo "## 备注"
  echo
  echo "> 大文件（数据集/模型/内核源码树等）不要提交，放仓库外并在上面写清路径。"
} > "$dir/README.md"
touch "$dir/notes/.gitkeep"

echo "已创建: projects/$name"
echo "  下一步: 写代码 -> git add -A && git commit -m \"feat($name): ...\" && git push"

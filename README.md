# workspace

服务器 B（软件所 `jiahao01-ubuntu-01`）上的**统一代码工作区**，同步到
<https://github.com/3223v/workspace>。

## 约定

**所有项目都放在这个仓库里，用一个大仓库（monorepo）统一管理。**

```
projects/<项目名>/     ← 每个项目一个子目录
notes/                 ← 跨项目的笔记、踩坑记录
scripts/               ← 仓库自带的小工具
```

新建项目：

```bash
cd ~/workspace
./scripts/new-project.sh 项目名
# ...写代码...
git add -A
git commit -m "feat(项目名): 初始提交"
git push
```

## ⚠️ 大文件绝不能进仓库

所有项目共用一个仓库，**提交过的大文件会永久留在 git 历史里**——删掉文件也不会释放，
只能重写历史才能清除。

GitHub 的硬限制：

| 限制 | 值 |
|---|---|
| 单个文件 | **> 100 MB 直接拒绝推送** |
| 单次推送 | > 2 GB 会被拒 |
| 仓库总体积 | 建议 < 1 GB，超过会收到警告 |

所以：

- **内核源码树（`linux-*`，数 GB）绝不入库**；要版本化内核改动，用 `git format-patch`
  导出 `.patch` 文件再提交
- **数据集 / 模型权重 / 视频 / 镜像 / 编译产物 / 日志**都不要提交
- 大文件放仓库外（例如 `/root/data/`），在项目 README 里写清路径与获取方式
- 每个项目可以有自己的 `.gitignore`（叠加生效），规则参考根目录那份
- 提交前扫一眼 `git status`；不确定就先确认 `.gitignore` 有没有覆盖

## 环境

已装 `python3 3.12` / `gcc 13.3` / `make 4.3` / `git 2.43`
未装 `node` / `npm` / `go` / `docker`（需要时告诉我装）

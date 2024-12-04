
# Git 仓库上传大文件

本指南将帮助你使用 Git LFS 管理大文件，并使用 `conda` 安装所需的软件。

## 1. 使用 Conda 安装 Git 和 Git LFS

首先确保 `conda` 已经安装在你的系统上。然后执行以下命令来安装 Git 和 Git LFS：

```bash
conda install -c conda-forge git git-lfs
```

安装完成后，初始化 Git LFS：

```bash
git lfs install
```

## 2. 配置 Git LFS 跟踪大文件

在你的项目目录中，设置 Git LFS 跟踪 ZIP 文件：

```bash
git lfs track "*.zip"
```

这将修改或创建 `.gitattributes` 文件，告诉 Git 哪些文件类型应该使用 LFS 存储。

## 3. 添加文件到 Git 仓库

将修改后的 `.gitattributes` 和 ZIP 文件添加到暂存区：

```bash
git add .gitattributes FLiBeTh0.zip
```

## 4. 提交更改

提交你的更改：

```bash
git commit -m "Add Th0 using LFS"
```

## 5. 配置 Git 用户信息

在首次推送前，确保配置了你的 Git 用户信息：

```bash
git config --global user.name "你的用户名"
git config --global user.email "你的邮箱地址"
```

## 6. 使用 Token 进行认证

在 GitHub 上生成一个访问令牌（Personal Access Token）用于认证。请按照以下步骤操作：

- 登录到 GitHub。
- 访问 [Settings > Developer settings > Personal access tokens](https://github.com/settings/tokens)。
- 点击 “Generate new token”，勾选所需权限，然后生成令牌。

使用生成的令牌作为密码：

```bash
git config --global credential.helper store
```

这样 Git 会在首次要求认证时保存你的用户名和访问令牌。

## 7. 推送更改到 GitHub

现在，你可以推送你的更改到 GitHub 了：

```bash
git push
```

以上步骤将帮助你使用 Git 和 Git LFS 管理和推送大文件到 GitHub。

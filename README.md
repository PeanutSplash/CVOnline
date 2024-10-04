# 在线简历查看器

## 项目简介

这是一个基于 Vue 3 和 Nuxt.js 构建的简单的在线简历查看器。它允许用户在线查看 PDF 格式的简历,并提供下载简历、复制联系邮箱的功能。

## 主要特性

- 📄 在线 PDF 简历查看
- 💾 一键下载简历
- 📋 快速复制联系邮箱
- 📱 响应式设计，完美适配移动端和桌面端

## 技术栈

- Vue 3
- Tailwind CSS
- @vue-office/pdf (PDF 渲染)
- Docker (容器化部署)

## 快速开始

### Docker 部署

1. 构建 Docker 镜像:

   ```sh
   pnpm build:docker
   ```

2. 运行 Docker 容器:

   ```sh
   docker run -p 9867:9867 cvonline
   ```

3. 访问 `http://localhost:9867`

## 自定义配置

在 `src/config/app.config.js` 文件中修改:

- `email`: 联系邮箱
- `resumeFileName`: 简历文件名
- `blogUrl`: 个人博客 URL

## 许可证

基于 [MIT](https://choosealicense.com/licenses/mit/) 许可证。

<p align="right">(<a href="#readme-top">返回顶部</a>)</p>

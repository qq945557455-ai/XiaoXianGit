---
type: project
status: active
created: 2026-07-01
updated: 2026-07-03
tags: [Unity, MCP, 命令行工具, 工具链]
sources:
  - https://github.com/AnkleBreaker-Studio/unity-mcp-server
  - https://github.com/AnkleBreaker-Studio/unity-mcp-plugin
---

# Unity 工程控制 / MCP

## 摘要

- 外部 Unity/Tuanjie 工程路径：`E:\GitHub\Unity_Pro\WeChat_Game`。
- 工程已安装 Unity MCP 插件：`com.anklebreaker.unity-mcp`，来源为 `https://github.com/AnkleBreaker-Studio/unity-mcp-plugin.git`。
- Unity/Tuanjie 编辑器桥接服务已在 `127.0.0.1:7890` 响应，项目名为 `WeChat_Game`。
- 已在本机安装 MCP 服务器命令行工具：`anklebreaker-unity-mcp@2.30.0`，可执行命令为 `unity-mcp.cmd`。
- 已写入 Codex 的 MCP 配置：`C:\Users\94555\.codex\config.toml` 中的 `[mcp_servers.unity]`。
- 已确认并启用 TMP / TextMeshPro：`com.unity.textmeshpro@3.0.9`，并导入 `TMP Essential Resources` 到 Unity 工程的 `Assets/TextMesh Pro/`。
- Unity 职能资源目录规则已改为拼音 + 大驼峰：`Assets/CeHua/`、`Assets/ChengXu/`、`Assets/MeiShu/`。

## 检查结果

### Unity 工程

- `Packages/manifest.json` 中存在：
  - `cn.tuanjie.codely.bridge: 1.0.64`
  - `com.anklebreaker.unity-mcp: https://github.com/AnkleBreaker-Studio/unity-mcp-plugin.git`
  - `com.unity.textmeshpro: 3.0.9`
- `Library/PackageCache/` 中存在：
  - `cn.tuanjie.codely.bridge@1.0.64`
  - `com.anklebreaker.unity-mcp@55cd393fe5`
  - `com.unity.textmeshpro@3.0.9`
- `Assets/TextMesh Pro/` 中已导入 TMP Essential Resources，包括：
  - `Resources/TMP Settings.asset`
  - `Resources/Fonts & Materials/LiberationSans SDF.asset`
  - TMP 默认 Shaders、Sprites、Fonts 和 Documentation
- `ProjectSettings/ProjectVersion.txt`：`2022.3.62t10`，Tuanjie 编辑器 `1.9.2`。

### 资源目录规则

- 策划内容存入 `Assets/CeHua/`。
- 程序内容存入 `Assets/ChengXu/`。
- 美术内容存入 `Assets/MeiShu/`。
- 后续新建 Unity 子目录时，继续使用拼音 + 大驼峰命名；不要再创建 `Assets/Game_WaJue/` 作为职能资源根目录。

### 本机工具

- Node.js：`v22.16.0`
- npm/npx：`10.9.2`
- 已安装全局 npm 包：`anklebreaker-unity-mcp@2.30.0`
- Unity/Tuanjie Hub 路径：`D:\Unity\Editor\Tuanjie Hub\Tuanjie Hub.exe`
- Tuanjie 编辑器路径：`D:\Unity\TuanJie_1.9.2\2022.3.62t10\Editor\Tuanjie.exe`

## 验证

桥接服务测试：

```json
{
  "status": "ok",
  "unityVersion": "2022.3.62t10",
  "projectName": "WeChat_Game",
  "projectPath": "E:/GitHub/Unity_Pro/WeChat_Game",
  "platform": "WindowsEditor"
}
```

MCP 服务器启动测试：

```text
[MCP] 工具层级：68 个核心工具 + 254 个高级工具（通过 unity_advanced_tool）= 共 322 个，当前暴露 79 个
Unity MCP 服务器正在通过标准输入输出运行
```

TMP 安装验证：

```json
{
  "packageInstalled": true,
  "packageVersion": "3.0.9",
  "packageSource": "Registry",
  "textMeshProFolderExists": true,
  "tmpSettingsImported": true,
  "defaultFontImported": true,
  "compilationErrors": 0
}
```

## 使用方式

- 重启 Codex/当前 AI 客户端后，新的 `unity` MCP 服务器才会被加载。
- Unity 编辑器内可通过 `Window > MCP Dashboard` 查看或重启桥接服务。
- 若端口冲突，优先在 Unity MCP Dashboard 与 Codex 配置中同步修改 `UNITY_BRIDGE_PORT`。

## 关联

- [[挡墙模型]]
- [[知识库/日志]]

## 待办 / 问题

- 重启 Codex 后确认 `unity` MCP 工具是否在会话中可用。
- 如后续需要自动打开工程，可补充 Tuanjie/Unity Hub 命令行启动脚本。
- 如需要 TMP 示例资源，可另行通过 `Window > TextMeshPro > Import TMP Examples and Extras` 导入；本次仅导入运行必需资源。

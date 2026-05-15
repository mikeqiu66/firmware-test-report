# 仓库与运行目录同步规范

## 目录角色

- 开发仓库：`C:\Users\zhangxincheng\.openclaw\workspace\repos\firmware-test-report`
- 运行目录：`C:\Users\zhangxincheng\.openclaw\workspace\skills\firmware-test-report`

## 默认规则

1. 日常修改一律优先在 `repos/firmware-test-report` 进行
2. `skills/firmware-test-report` 只作为运行副本
3. 每次仓库稳定后，再从 `repos` 同步到 `skills`
4. 不反向从 `skills` 覆盖 `repos`，除非明确是在应急修复且已人工确认

## 推荐流程

### 开发修改
1. 在 `repos/firmware-test-report` 修改文件
2. 本地检查内容是否正确
3. 提交 git
4. 推送远程
5. 将变更同步到 `skills/firmware-test-report`

### 同步范围
默认同步以下文件/目录：
- `SKILL.md`
- `README.md`
- `references/`
- `assets/`（如果后续新增）
- `scripts/`（如果后续新增）

默认不同步：
- `.git/`
- 临时文件
- 本地测试产物
- IDE 配置文件

## PowerShell 同步命令

```powershell
$repo = 'C:\Users\zhangxincheng\.openclaw\workspace\repos\firmware-test-report'
$skill = 'C:\Users\zhangxincheng\.openclaw\workspace\skills\firmware-test-report'

if (-not (Test-Path $skill)) {
  New-Item -ItemType Directory -Force -Path $skill | Out-Null
}

Copy-Item "$repo\SKILL.md" $skill -Force
if (Test-Path "$repo\README.md") { Copy-Item "$repo\README.md" $skill -Force }
if (Test-Path "$repo\references") {
  Remove-Item "$skill\references" -Recurse -Force -ErrorAction SilentlyContinue
  Copy-Item "$repo\references" $skill -Recurse -Force
}
if (Test-Path "$repo\assets") {
  Remove-Item "$skill\assets" -Recurse -Force -ErrorAction SilentlyContinue
  Copy-Item "$repo\assets" $skill -Recurse -Force
}
if (Test-Path "$repo\scripts") {
  Remove-Item "$skill\scripts" -Recurse -Force -ErrorAction SilentlyContinue
  Copy-Item "$repo\scripts" $skill -Recurse -Force
}
```

## 维护建议

- 小改动：先改 `repos`，确认后再同步
- 结构调整：先在 `repos` 完成，再一次性同步到 `skills`
- 发布前：确认 `repos` 与 `skills` 的 `SKILL.md` / `README.md` 一致

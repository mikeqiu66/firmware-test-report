# firmware-test-report

固件测试报告 Skill，用于根据固件测试过程资料生成或更新飞书云文档格式的测试报告。

## 功能概览

- 按轮次创建固件测试报告
- 更新已有测试报告
- 解析 ONES 缺陷 Excel 并回填缺陷章节
- 结合工时信息生成测试概要
- 根据缺陷状态生成风险项和测试结论

## 目录结构

- `SKILL.md`：Skill 主规范
- `README.md`：快速说明与使用示例
- `SYNC.md`：`repos/` 与 `skills/` 的同步规范
- `references/defect-table.md`：缺陷表参考格式

## 推荐触发语

- `生成固件测试报告`
- `帮我写第2轮固件测试报告`
- `更新这个固件测试报告`
- `我发你 ONES 缺陷 Excel，你帮我同步到报告里`

## 建议输入材料

为了减少来回确认，建议尽量一次性提供：

1. 设备名称
2. 固件版本号
3. 当前第几轮测试
4. 本轮测试起止日期
5. 现有报告链接（如果是更新）
6. ONES 缺陷 Excel（如果需要生成第三章）
7. 工时表链接，或手动工时信息
8. 固件转测单截图（如果要补修改内容详情）

## 工时依赖策略

本 Skill 不再硬编码依赖某个固定路径的外部 Skill。

工时相关按以下优先级处理：
1. 先读 `TOOLS.md` 中是否登记了工时表
2. 再读用户直接提供的工时表链接
3. 如果没有可读工时表，则改为让用户手动提供工时信息

## 最小使用示例

### 新建报告

```text
帮我写 Hub 3 V21.17.17 第三轮固件测试报告，测试时间 2026/05/10-2026/05/14。
```

### 更新报告

```text
帮我更新这个测试报告：https://xxx.feishu.cn/docx/xxxx
本轮测试时间是 2026/05/10-2026/05/14。
```

### 同步缺陷

```text
我现在发你 ONES 导出的缺陷 Excel，你按这个 skill 更新报告里的缺陷章节。
```

## 维护约定

- 开发维护目录：`workspace/repos/firmware-test-report`
- 运行目录：`workspace/skills/firmware-test-report`
- 日常修改优先在 `repos/firmware-test-report` 完成
- 稳定后再同步到 `skills/firmware-test-report`

## 开发者工作流

推荐按下面顺序维护：

1. 在 `repos/firmware-test-report` 修改内容
2. 本地检查 `SKILL.md` / `README.md` / `references/` 是否符合预期
3. 执行同步脚本：`scripts/sync-to-skills.ps1`
4. 确认 `skills/firmware-test-report` 已拿到最新副本
5. 提交 git
6. 推送远程

常用命令示例：

```powershell
cd C:\Users\zhangxincheng\.openclaw\workspace\repos\firmware-test-report
powershell -ExecutionPolicy Bypass -File .\scripts\sync-to-skills.ps1
git status
git add .
git commit -m "feat: ..."
git push origin main
```

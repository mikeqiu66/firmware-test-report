# 缺陷表格详细格式

## Excel 输入格式（10列）

| 列 | 字段名 | 说明 |
|----|--------|------|
| A | ID | Bug编号，如 W1091-193520 |
| B | 标题 | Bug描述 |
| C | 优先级 | 普通/重要/紧急 |
| D | 状态 | 关闭/回归通过/待评审/测试提交/持续跟踪 |
| E | 固件版本 | 如 21.17.17 |
| F | 目标验证版本 | 如 V15 |
| G | 创建者 | 提交人 |
| H | 负责人 | 开发负责人 |
| I | 创建时间 | 完整格式 YYYY-MM-DD HH:mm:ss |
| J | 更新时间 | 完整格式 YYYY-MM-DD HH:mm:ss |

⚠️ **时间格式必须与原始 Excel 一致（YYYY-MM-DD HH:mm:ss），禁止截短或省略。**
⚠️ **所有字段数据必须与用户提供的原始数据完全一致，禁止修改、截短、重新排列、改写任何内容（包括 ID、标题、人名、时间等）。**

## 状态颜色映射

⚠️ **飞书 lark-table 单元格内不支持 `<font>` 颜色标签**，写了会直接当文本显示。状态列只写纯文字。

| 状态 | 写法 |
|------|------|
| 关闭 | 关闭 |
| 回归通过 | 回归通过 |
| 待评审 | 待评审 |
| 测试提交 | 测试提交 |
| 持续跟踪 | 持续跟踪 |
| 非bug | 非bug |
| 重复bug | 重复bug |

## 回归结果颜色映射

| 回归结果 | 颜色标签 |
|----------|----------|
| 回归通过 | `<font color="green">回归通过</font>` |
| 回归失败 | `<font color="red">回归失败</font>` |
| 关闭 | `<font color="green">关闭</font>` |
| 测试提交 | `<font color="red">测试提交</font>` |
| 持续跟踪 | `<font color="blue">持续跟踪</font>` |

## 输出表格格式（lark-table）

### 回归结果表（8列）

```html
<lark-table rows="N" cols="8" header-row="true" column-widths="100,250,90,90,70,70,90,90">
  <lark-tr>
    <lark-td>ID</lark-td>
    <lark-td>标题</lark-td>
    <lark-td>上轮状态</lark-td>
    <lark-td>回归结果</lark-td>
    <lark-td>负责人</lark-td>
    <lark-td>创建者</lark-td>
    <lark-td>创建时间</lark-td>
    <lark-td>更新时间</lark-td>
  </lark-tr>
  <!-- 数据行 -->
</lark-table>
```

### 新增缺陷表（8列）

```html
<lark-table rows="N" cols="8" header-row="true" column-widths="100,250,70,80,70,70,90,90">
  <lark-tr>
    <lark-td>ID</lark-td>
    <lark-td>标题</lark-td>
    <lark-td>优先级</lark-td>
    <lark-td>状态</lark-td>
    <lark-td>负责人</lark-td>
    <lark-td>创建者</lark-td>
    <lark-td>创建时间</lark-td>
    <lark-td>更新时间</lark-td>
  </lark-tr>
  <!-- 数据行 -->
</lark-table>
```

### 风险项表（7列）

```html
<lark-table rows="N" cols="7" header-row="true" column-widths="100,280,80,70,70,90,90">
  <lark-tr>
    <lark-td>ID</lark-td>
    <lark-td>标题</lark-td>
    <lark-td>状态</lark-td>
    <lark-td>负责人</lark-td>
    <lark-td>创建者</lark-td>
    <lark-td>创建时间</lark-td>
    <lark-td>更新时间</lark-td>
  </lark-tr>
  <!-- 数据行 -->
</lark-table>
```

### 缺陷统计表（3列）

```html
<lark-table rows="N" cols="3" header-row="true" column-widths="150,80,200">
  <lark-tr>
    <lark-td>状态</lark-td>
    <lark-td>数量</lark-td>
    <lark-td>占比</lark-td>
  </lark-tr>
  <!-- 各状态行 + 合计行 + 闭环率行 -->
</lark-table>
```

### 工时投入详情表（5列）

```html
<lark-table rows="N" cols="5" header-row="true" column-widths="100,146,200,80,80">
  <lark-tr>
    <lark-td>测试者</lark-td>
    <lark-td>日期</lark-td>
    <lark-td>任务内容</lark-td>
    <lark-td>工时(h)</lark-td>
    <lark-td>人日</lark-td>
  </lark-tr>
  <!-- 数据行 -->
  <lark-tr>
    <lark-td>**合计**</lark-td>
    <lark-td></lark-td>
    <lark-td>-</lark-td>
    <lark-td>**XX**</lark-td>
    <lark-td>**X.X**</lark-td>
  </lark-tr>
</lark-table>
```

## 测试结论 callout 格式

### PASS
```html
<callout emoji="white_check_mark" background-color="light-green">
**测试通过** 第{X}轮测试完成。总计 X 条缺陷全部关闭/回归通过。
</callout>
```

### 有条件通过
```html
<callout emoji="warning" background-color="light-yellow">
**有条件通过** 第{X}轮测试完成。...
</callout>
```

### 不通过
```html
<callout emoji="x" background-color="light-red">
**测试不通过** 第{X}轮测试完成。总计 X 条缺陷中仍有 X 条未修复...
**遗留未修复（测试提交 X 条）：**
- {ID}：{标题}（{负责人}）
**持续跟踪（X 条）：**
- {ID}：{标题}（{负责人}）
建议针对以上遗留问题进行第{X+1}轮修复。
</callout>
```

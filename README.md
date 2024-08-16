# 开放式NPC

* [简介](#简介)
* [接口](#接口)
    * [创建NPC](#创建npc)
    * [生成NPC](#生成npc)
    * [目标选择器](#目标选择器)
    * [数据值优先级](#数据值优先级)
* [示例](#示例)
* [多人游戏兼容性](#多人游戏兼容性)
* [占用的数据值](#占用的数据值)


# 简介

开放式 NPC （OpenNPC）是一个我的世界数据包。可以生成带有对话、选项、可高度自定义的**交互实体**。

# 接口

## 创建NPC

修改**命令存储**可以创建 NPC
```
data modify storage gufandf:open_npc/npc <NPC命名空间> set value <NPC数据>
```
**NPC数据**是一个列表，储存了这个 NPC 的所有对话与选项内容。列表中的每一项为一个字典（称为一个**对话组件**），储存了本句对话或选项的内容。对话组件的所有数据值如下：

> 所有数据值都是**可选的**

```
{
    "text": <本对话的文本组件>,
    "fx": <音效>,
    "functions": [
        <交互后运行的一条指令>,
        ...
    ],
    "jump_to": <跳转到位置>，
    "options": [
        {
            <一个选项>
            "option": <本选项的文本组件>,
            "item": <选项使用的物品>,
            "custom_model_data": <物品的custom_model_data>,
            "text": <选择本选项后的文本组件>,
            "fx": <音效>,
            "functions": [
                <选择后运行的一条指令>,
                ...
            ],
            "jump_to": <跳转到位置>，
        },
        ...
    ]
}
```
`text` 的值为字符串格式的文本组件，需要使用(')括起，如`'[{"text":"test text"}]'`

`functions` 中的指令（不加/）会按照顺序依次运行，但强烈建议将多行指令放入函数文件后用 `function` 运行。

`fx` 的值为 `/playsound` 后的音效ID。

`item` 的值为物品 ID，默认为 `minecraft:firework_star`。

`custom_model_data` 的值为物品的 `custom_model_data`，默认为 `0`。

`jump_to` 的值为这段对话下一句的位置，默认为下一句。设置为 `0` 跳转到第 `1` 句，以此类推。




## 生成NPC

使用以下命令在当前位置生成 NPC。

```mcfunction
function gufandf:open_npc/npc/create {npc_name:<NPC命名空间>}
```

NPC 在记分板 open_npc_chat 上的分数为当前对话的进度，0 分为第 1 句，修改记分板分数可以直接设置对话进度。实际上这就是 jump_to 方法的原理。

## 目标选择器
|选择器|目标|
|---|---|
|@e[tag=npc]|所有 NPC|
|@e[tag=<NPC命名空间>]|指定 NPC|
|@e[nbt={Tags:[<NPC命名空间>]}]|指定 NPC（中文）|

以下选择器仅可在 functions 中的命令中生效：
|选择器|目标|
|---|---|
|@a[tag=open_npc_target]|对话的玩家|
|@e[tag=open_npc_npc] 或 @s|当前NPC|

## 数据值优先级

优先级：
- functions
- text
- fx
- jump_to
- options

这意味着，在 functions 中可以进行更加复杂的判断并修改其他数值。如需要根据游戏耗时的不同让 NPC 进行不同的对话，则可以在 functions 中使用 `/execute` 语句判断条件并修改 `gufandf:open_npc/chat temp.content.text` 的值。

# 示例

以下为内置示例，可以使用 `function gufandf:open_npc/npc/create {npc_name:"铁匠"}` 生成：

```
[
    {
        "text": '[{"text":"你好，冒险家！"}]',
        "fx": "minecraft:entity.villager.celebrate"
    },
    {
        "text": '[{"text":"你需要什么帮助吗？"}]',
        "fx": "minecraft:entity.villager.celebrate",
        "options": [
            {
                "option": '[{"text":"需要！"}]',
                "item": "minecraft:firework_star",
                "custom_model_data": 1
            },
            {
                "option": '[{"text":"不需要"}]',
                "item": "minecraft:firework_star",
                "custom_model_data": 1,
                "jump_to": 4
            }
        ]
    },
    {
        "text": '[{"text":"请问需要什么帮助？"}]',
        "fx": "minecraft:entity.villager.celebrate",
        "options": [
            {
                "option": '[{"text":"我需要一把武器！"}]',
                "text": '[{"text":"给你钻石剑"}]',
                "fx": "minecraft:entity.villager.celebrate",
                "jump_to": 4,
                "functions": [
                    "give @a[tag=open_npc_target] diamond_sword"
                ]
            },
            {
                "option": '[{"text":"我需要一身盔甲！"}]',
                "text": '[{"text":"给你钻石胸甲"}]',
                "fx": "minecraft:entity.villager.celebrate",
                "jump_to": 4,
                "functions": [
                    "give @a[tag=open_npc_target] minecraft:diamond_chestplate"
                ]
            }
        ]
    },
    {
        "text": '[{"text":"我已经没有什么能帮到你的了"}]',
        "fx": "minecraft:entity.villager.celebrate"
    },
    {
        "text": '[{"text":"去闯荡吧，冒险家！"}]',
        "fx": "minecraft:entity.villager.celebrate",
        "jump_to": 3
    }
]

```

# 多人游戏兼容性
兼容，当玩家与 NPC 对话时，NPC 的对话将显示在玩家的 actionbar，而其它玩家会在聊天栏看到消息。当玩家进行选项选择时，其他玩家无法与当前 NPC 交互。

# 占用的数据值

> 请不要随意占用任何数据值

|类型|值|
|------|:----- |
| 命名空间 |gufandf|
| 记分板 |open_npc_chat、pid|
| 命令存储 |gufandf:open_npc/npc|
| 实体tag |open_npc_target、open_npc_npc、temp_open_npc_end、open_npc_itme1、open_npc_itme2、temp_item_load_player、temp_item_save_player、npc、dont_throw_item、<NPC命名空间>|

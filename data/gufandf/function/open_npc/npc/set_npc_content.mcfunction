data modify storage gufandf:open_npc/npc 铁匠 set value [\
    {\
        "text": '[{"text":"你好，冒险家！"}]',\
        "fx": "minecraft:entity.villager.celebrate"\
    },\
    {\
        "text": '[{"text":"你需要什么帮助吗？"}]',\
        "fx": "minecraft:entity.villager.celebrate",\
        "options": [\
            {\
                "option": '[{"text":"需要！"}]',\
                "item": "minecraft:firework_star",\
                "custom_model_data": 1\
            },\
            {\
                "option": '[{"text":"不需要"}]',\
                "item": "minecraft:firework_star",\
                "custom_model_data": 1,\
                "jump_to": 4\
            }\
        ]\
    },\
    {\
        "text": '[{"text":"请问需要什么帮助？"}]',\
        "fx": "minecraft:entity.villager.celebrate",\
        "options": [\
            {\
                "option": '[{"text":"我需要一把武器！"}]',\
                "text": '[{"text":"给你钻石剑"}]',\
                "fx": "minecraft:entity.villager.celebrate",\
                "jump_to": 4,\
                "functions": [\
                    "give @a[tag=open_npc_target] diamond_sword"\
                ]\
            },\
            {\
                "option": '[{"text":"我需要一身盔甲！"}]',\
                "text": '[{"text":"给你钻石胸甲"}]',\
                "fx": "minecraft:entity.villager.celebrate",\
                "jump_to": 4,\
                "functions": [\
                    "give @a[tag=open_npc_target] minecraft:diamond_chestplate"\
                ]\
            }\
        ]\
    },\
    {\
        "text": '[{"text":"我已经没有什么能帮到你的了"}]',\
        "fx": "minecraft:entity.villager.celebrate"\
    },\
    {\
        "text": '[{"text":"去闯荡吧，冒险家！"}]',\
        "fx": "minecraft:entity.villager.celebrate",\
        "jump_to": 3\
    }\
]
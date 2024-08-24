-- the quests on character
select quest.LogTitle, quest.LogDescription
from acore_characters.characters c
inner join acore_characters.character_queststatus cq on cq.guid = c.guid
inner join acore_world.quest_template quest on quest.ID = cq.quest
where c.guid = 1

-- definition && mobs to kill to complete it
select quest.LogTitle, quest.RequiredNpcOrGoCount1 count1, mob1.name, quest.RequiredNpcOrGoCount2, mob2.name
from acore_world.quest_template quest
left join acore_world.creature_template mob1 on mob1.entry = quest.RequiredNpcOrGo1
left join acore_world.creature_template mob2 on mob2.entry = quest.RequiredNpcOrGo2
where quest.ID = 364

-- player just interacted with creature guid: 29804
-- name & quest it ends + the text for that quest
select ct.name as npc_ends, quest.LogTitle, text.ID test_id,text.text0_0 , text.text0_1, text.text1_0
from acore_world.creature c
inner join acore_world.creature_template ct on ct.entry = c.id1
inner join acore_world.creature_questender cq on cq.id = ct.entry
inner join acore_world.quest_template quest on quest.ID = cq.quest
inner join acore_world.gossip_menu gm on gm.MenuID = ct.gossip_menu_id
inner join acore_world.npc_text text on gm.TextID =text.ID
where c.guid = 29804

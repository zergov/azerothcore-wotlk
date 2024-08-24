-- item on the chest of character 1
-- slot 4 == chest
explain select it.*
from acore_characters.characters c
inner join acore_characters.character_inventory ci on ci.guid = c.guid
inner join acore_characters.item_instance ii on ci.item = ii.guid
inner join acore_world.item_template it on it.entry = ii.itemEntry
where c.guid = 1 and ci.slot = 4;

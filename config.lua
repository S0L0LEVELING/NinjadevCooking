Config = {}
Config.Locale = 'en'
Config.EnableCommand = true --if not the cookbook will be toggled from inventory
Config.TextSize = 0.6
Config.Command = 'Cookbook'
Config.RewardMultiplier = 1 
Config.MenuAlign = 'top-right'
Config.Recipes = {
    {['recipe'] = 'Gourmet Burger', ['item'] ='gourmetburger', ['ingredients'] = {
        {['ingredient'] = 'Bread', ['amount'] = 1},
        {['ingredient'] = 'Tomato', ['amount'] = 1},
        {['ingredient'] = 'Lettuce', ['amount'] = 1},
        {['ingredient'] = 'Pickle', ['amount'] = 1},
        {['ingredient'] = 'Beef', ['amount'] = 1}
    }},
    {['recipe'] = 'Veggie Burger', ['item'] ='veggieburger', ['ingredients'] = {
        {['ingredient'] = 'Bread', ['amount'] = 1},
        {['ingredient'] = 'Tomato', ['amount'] = 1},
        {['ingredient'] = 'Lettuce', ['amount'] = 1},
        {['ingredient'] = 'Pickle', ['amount'] = 1},
        {['ingredient'] = 'Vpatty', ['amount'] = 1}
    }},
    {['recipe'] = 'Chicken Sammy', ['item'] ='chickensand', ['ingredients'] = {
        {['ingredient'] = 'Bread', ['amount'] = 1},
        {['ingredient'] = 'Tomato', ['amount'] = 1},
        {['ingredient'] = 'Lettuce', ['amount'] = 1},
        {['ingredient'] = 'Pickle', ['amount'] = 1},
        {['ingredient'] = 'Mayo', ['amount'] = 1},
        {['ingredient'] = 'Chicken', ['amount'] = 1}
    }},
}

Config.Items = {
    ['Tomato'] = 'tomato',
    ['Beef'] = 'beef',
    ['Bread'] = 'bread',
    ['Sausage'] = 'sausage',
    ['Lettuce'] = 'lettuce',
    ['Flour'] = 'flour',
    ['Potato'] = 'potato',
    ['Cheese'] = 'cheese',
    ['Chicken'] = 'chicken',
    ['Lobster'] = 'lobster',
    ['Pickle'] = 'pickle',
    ['Vpatty'] = 'vpatty',
}
Config.Locations = {
    ["Stove1"] = {
        ['coords'] = vector3(-1200.118, -900.253, 13.995), -- Grill at burgershot
        ['heading'] = 124.556
    },
} 

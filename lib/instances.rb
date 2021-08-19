
town = Alignment.new('Town')
town.vanilla = 'Vanilla Townie'
town.vanillas = 'Vanilla Townies'

mafia = Alignment.new('Mafia')
mafia.vanilla = 'Mafia Goon'
mafia.vanillas = 'Mafia Goons'

ww = Alignment.new('Werewolves', 'Mafia')
ww.vanilla = 'Werewolf'
ww.vanillas = 'Werewolves'


lp = Setup.new('Less Pressure')
lp.add_roles(
    'Town Innocent Child',
    'Town Innocent Child',
    'Town',
    'Town',
    'Town',
    'Mafia',
    'Mafia',
    'Mafia',
)

standard = Setup.new('Standard')
standard.add_roles(
    'Town Cop',
    'Town Doctor',
    'Town',
    'Town',
    'Town',
    'Mafia',
    'Mafia'
)
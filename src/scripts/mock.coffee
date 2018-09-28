LightDM = {}

LightDM.MockData =
  greeter:
    hostname: 'Mock Greeter'
  branding:
    logo: '/usr/share/pixmaps/rive/logo'
    user_logo: '/usr/share/pixmaps/archlinux-user.svg'
    background_images: '/usr/share/backgrounds'
  languages: [
      name: 'English'
      code: 'en_US.utf8'
      territory: 'USA'
    ,
      name: 'Catalan'
      code: 'ca_ES.utf8'
      territory: 'Spain'
    ,
      name: 'French'
      code: 'fr_FR.utf8'
      territory: 'France'
  ]
  layouts: [
      name: 'us'
      short_description: 'en'
      description: 'English (US)'
    ,
      name: 'at'
      short_description: 'de'
      description: 'German (Austria)'
    ,
      name: 'us rus'
      short_description: 'ru'
      description: 'Russian (US, phonetic)'
  ]
  sessions: [
      key: 'i3'
      name: 'i3wm'
      comment: 'This session logs you into i3wm'
    ,
      key: 'gnome'
      name: 'GNOME'
      comment: 'This session logs you into GNOME'
    ,
      key: 'cinnamon'
      name: 'Cinnamon'
      comment: 'This session logs you into Cinnamon'
    ,
      key: 'plasma'
      name: 'Plasma'
      comment: 'Plasma by KDE'
    ,
      key: 'mate'
      name: 'MATE'
      comment: 'This session logs you into MATE'
    ,
      key: 'openbox'
      name: 'Openbox'
      comment: 'This session logs you into Openbox'
  ]

class LightDM.Greeter
  constructor: (mock_data=LightDM.MockData) ->
    @layouts   = mock_data.layouts
    @languages = mock_data.languages
    @sessions  = mock_data.sessions

  authenticate: (username=null) ->
    true

class LightDM.ThemeUtils
  dirlist: (directory) -> # TODO: Would be better to make a fake fs structure in mock_data
    if '/usr/share/backgrounds' == directory
      [
        '/usr/share/backgrounds/rive'
      ]
    else if '/usr/share/backgrounds/rive' == directory
      [
        '/usr/share/backgrounds/rive/Camaleno-Spain-by-Mathew-MacQuarrie.png',
        '/usr/share/backgrounds/rive/Chowan-River-Tree-by-Ryan-Scott-Lewis.png',
        '/usr/share/backgrounds/rive/Extra-EA300L-by-Erik-Astrom.png',
        '/usr/share/backgrounds/rive/Thatcher-Park-by-Natale-Anne-Gwinn.png',
      ]
    else
      []

class LightDM.GreeterConfig
  constructor: (mock_data=LightDM.MockData) ->
    @branding = mock_data.branding

  get_str: (key, subkey) ->
    @[key][subkey]

module.exports = LightDM


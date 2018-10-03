# Handles LightDM callbacks
module.exports = class App.Callbacks
  constructor: () ->
    window.show_prompt             = @show_prompt
    window.show_message            = @show_message
    #window.start_authentication    = @start_authentication
    #window.cancel_authentication   = @cancel_authentication
    window.authentication_complete = @authentication_complete
    window.autologin_timer_expired = @autologin_timer_expired

  show_prompt:           (text, type) -> console.log("show_prompt: #{text} #{type}")
  show_message:          (text, type) -> console.log("show_message: #{text} #{type}")
  #start_authentication:               -> console.log("start_authentication")
  #cancel_authentication:              -> console.log("cancel_authentication")
  authentication_complete:            -> console.log("authentication_complete")
  autologin_timer_expired: (username) -> console.log("autologin_timer_expired: #{username}")


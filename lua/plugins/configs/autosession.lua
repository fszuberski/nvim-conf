local present, autosession = pcall(require, "auto-session")

if not present then
    return
end

local options = {
      log_level = 'info',
      auto_session_suppress_dirs = {'~/'}
}

autosession.setup(options)

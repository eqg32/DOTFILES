alias fucking = doas
alias reboot = loginctl reboot
alias poweroff = loginctl poweroff
alias male = make

$env.config.show_banner = false
$env.config.table.mode = "light"

$env.config.buffer_editor = "hx"
$env.EDITOR = "hx"

$env.config.keybindings ++= [{
    name: alt_ls
    modifier: alt
    keycode: char_l
    mode: emacs
    event: {
        send: executehostcommand
        cmd: "clear; ls"
    }
}]

#InstallKeybdHook

; Esc to `mapping
^`::Send ``
$`::Send {Esc}

; Capslock to ctrl
Capslock::LControl
Return

; Change Window
^#l::Send ^#{Right}
^#h::Send ^#{Left}
Return

; 방향키 대용
!h::Send {Left}
!j::Send {Down}
!k::Send {Up}
!l::Send {Right}

+!h::Send +{Left}
+!j::Send +{Down}
+!k::Send +{Up}
+!l::Send +{Right}

^!h::Send {Home}
^!l::Send {End}
^!j::Send {PgDn}
^!k::Send {PgUp}

^+!h::Send !{Left}
^+!l::Send !{Right}
Return

; 한영 전환
^Space:: 
send, {vk15sc138} 
return

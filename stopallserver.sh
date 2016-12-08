#kill -15 `pgrep RegServer`
kill -15 `pgrep SuperServer`
kill -15 `pgrep MatchServer`
kill -15 `pgrep LobbyServer`
kill -15 `pgrep BattleServer`
kill -15 `pgrep RecordServer`
kill -15 `pgrep LogServer`
kill -15 `pgrep SessionServer`

ps -aux|grep Server

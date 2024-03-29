 1]Aim: To implement 1 bit stop n wait protocol
set ns [new Simulator]

#$ns color 1 Blue
#$ns color 2 Red

set namfile [open out.nam w]
$ns namtrace-all $namfile

proc finish {} {
global ns namfile
$ns flush-trace
close $namfile
exec nam out.nam &
exit 0
}

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]

$ns duplex-link $n0 $n1 2Mb 200ms DropTail
$ns duplex-link $n1 $n2 2Mb 10ms DropTail
$ns duplex-link $n2 $n3 2Mb 10ms DropTail
$ns queue-limit $n0 $n1 15


Agent/TCP set nam_tracevar_ true

set tcp [new Agent/TCP]
$tcp set window_ 1
$tcp set maxcwnd_ 1
$ns attach-agent $n0 $tcp

set sink [new Agent/TCPSink]
$ns attach-agent $n1 $sink

$ns connect $tcp $sink

set ftp [new Application/FTP]
$ftp attach-agent $tcp

$ns add-agent-trace $tcp tcp
#$ns monitor-agent-trace $tcp
$tcp tracevar cwnd_

$ns at 0.1 "$ftp start"
$ns at 3.0 "$ns detach-agent $n0 $tcp ; $ns detach-agent $n1 $sink"
$ns at 3.5 "finish"

$ns at 0.0 "$ns trace-annotate \"Stop and Wait with normal operation\""

$ns at 0.05 "$ns trace-annotate \"FTP starts at 0.1\""

$ns at 0.11 "$ns trace-annotate \"Send Packet_0\""
$ns at 0.35 "$ns trace-annotate \"Receive Ack_0\""
$ns at 0.56 "$ns trace-annotate \"Send Packet_1\""
$ns at 0.79 "$ns trace-annotate \"Receive Ack_1\""
$ns at 0.99 "$ns trace-annotate \"Send Packet_2\""
$ns at 1.23 "$ns trace-annotate \"Receive Ack_2  \""
$ns at 1.43 "$ns trace-annotate \"Send Packet_3\""
$ns at 1.67 "$ns trace-annotate \"Receive Ack_3\""
$ns at 1.88 "$ns trace-annotate \"Send Packet_4\""
$ns at 2.11 "$ns trace-annotate \"Receive Ack_4\""
$ns at 2.32 "$ns trace-annotate \"Send Packet_5\""
$ns at 2.55 "$ns trace-annotate \"Receive Ack_5    \""
$ns at 2.75 "$ns trace-annotate \"Send Packet_6\""
$ns at 2.99 "$ns trace-annotate \"Receive Ack_6\""

$ns at 3.1 "$ns trace-annotate \"FTP stops\""


$ns at 0.0 "$n0 label Sender"
$ns at 0.0 "$n1 label Receiver"
#$ns at 0.00 "$cbr start"
#$ns at 3.5 "$cbr stop"

#$ns at 4.0 "finish"

$ns run


 2] 
 Aim: To implement n bit stop n wait protocol
set ns [new Simulator]

#$ns color 1 Blue
#$ns color 2 Red

set namfile [open out.nam w]
$ns namtrace-all $namfile


proc finish {} {
global ns namfile
$ns flush-trace
close $namfile
exec nam out.nam &
exit 0
}
set n0 [$ns node]
set n1 [$ns node]
#set n2 [$ns node]
#set n3 [$ns node]

$ns duplex-link $n0 $n1 2Mb 200ms DropTail
#$ns duplex-link $n1 $n2 2Mb 10ms DropTail
#$ns duplex-link $n2 $n3 2Mb 10ms DropTail
$ns queue-limit $n0 $n1 10


Agent/TCP set nam_tracevar_ true

set tcp [new Agent/TCP]

$tcp set maxcwnd_ 8
$ns attach-agent $n0 $tcp

set sink [new Agent/TCPSink]
$ns attach-agent $n1 $sink

$ns connect $tcp $sink

set ftp [new Application/FTP]
$ftp attach-agent $tcp

$ns add-agent-trace $tcp tcp
$ns monitor-agent-trace $tcp
$tcp tracevar cwnd_

$ns at 0.1 "$ftp start"
$ns at 3.0 "$ns detach-agent $n0 $tcp ; $ns detach-agent $n1 $sink"
$ns at 3.5 "finish"

$ns at 0.0 "$ns trace-annotate \"Slow Start with maximum window size 8 (normal operation)\""

$ns at 0.05 "$ns trace-annotate \"FTP ends at 0.1\""

$ns at 0.11 "$ns trace-annotate \"Send Packet_0 : Initial window size = 1\""
$ns at 0.34 "$ns trace-annotate \"Receive Ack_0\""
$ns at 0.56 "$ns trace-annotate \"Send Packet_1,2 : Increase window size to 2\""
$ns at 0.79 "$ns trace-annotate \"Receive Ack_1,2\""
$ns at 0.99 "$ns trace-annotate \"Send Packet_3,4,5,6 : Increase window size to 4\""
$ns at 1.23 "$ns trace-annotate \"Receive Ack_3,4,5,6  \""
$ns at 1.43 "$ns trace-annotate \"Send Packet_7,8,9,10,11,12,13,14 : Increase window size to 8\""
$ns at 1.67 "$ns trace-annotate \"Receive Ack_7,8,9,10,11,12,13,14\""
$ns at 1.88 "$ns trace-annotate \"Send Packet_15,16,17,18,19,20,21,22 : Keep maximum window size,8\""
$ns at 2.11 "$ns trace-annotate \"Receive Ack_15,16,17,18,19,20,21,22\""
$ns at 2.32 "$ns trace-annotate \"Send Packet_23,24,25,26,27,28,29,30\ : Keep maximum window size, 8\""
$ns at 2.56 "$ns trace-annotate \"Receive Ack_23,24,25,26,27,28,29,30\""
$ns at 2.78 "$ns trace-annotate \"Send Packet_31,32,33,34,35,36,37,38\ : Keep maximum window size, 8\""
$ns at 3.00 "$ns trace-annotate \"Receive Ack_31\""

$ns at 3.1 "$ns trace-annotate \"FTP stops\""

$ns at 0.0 "$n0 label Sender"
$ns at 0.0 "$n1 label Receiver"
#$ns at 0.00 "$cbr start"
#$ns at 3.5 "$cbr stop"

#$ns at 4.0 "finish"

$ns run

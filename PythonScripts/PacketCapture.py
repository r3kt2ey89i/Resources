import socket
import os, time
from struct import*


class Anthena:

    def __init__(self, Type='', args=('','')):
        self._log = {}
        if Type != '':
            self._Type = Type
        y = True
        for k in args:
            if k != '':
                y = False
        if not y:
            self._args = args
        pass

    def local(self):
        host = ''
	try:
        	port = ''
	except Exception as e:
		port = ''

        socket_protocol = socket.IPPROTO_IP
        sniffer = socket.socket(socket.AF_INET, socket.SOCK_RAW, socket.IPPROTO_TCP)
        sniffer.setsockopt(socket.IPPROTO_IP, socket.IP_HDRINCL, 1)
        print sniffer.recvfrom(65565)
        print '\n'
        print 'receiving packets...\n'
        j = 1
        st = 2
        while True:
                st += 1
                try:
                    if not st%100:
                        print "********************************************************************************"
                        print "                          HOSTS FOUND ON LOG                                    "
                        for addr in self._log:
                            print addr, self._log[addr]
                        print "********************************************************************************"
                        time.sleep(5)
                        st = 2
                    I = '--------------------------------------------------------------'
                    k = len(I)
                    print '-'*j + str(j) + '-'*(k-j)
                    j += 1
                    if j == k:
                        j = 1
                    res = sniffer.recvfrom(65565)
                    print res
                    if len(str(res)) > 1000:
                        with open('txt.txt', mode='w') as save:
                            save.write(str(res))
                            save.close()
                            print 'RAW:'
                            print res
                            print '\n'
                    print 'MSG:'
                    packet = res[0]
                    ip_header = packet[0:20]
                    iph = unpack('!BBHHHBBH4s4s', ip_header)
                    version_ihl = iph[0]
                    version = version_ihl >> 4
                    ihl = version_ihl & 0xF
                    iph_length = ihl * 4
                    ttl = iph[5]
                    protocol = iph[6]
                    s_addr = socket.inet_ntoa(iph[8])
                    d_addr = socket.inet_ntoa(iph[9])
                    print 'Version : ' + str(version) + ' IP Header Length : ' + str(ihl) + ' TTL : ' + str(
                        ttl) + ' Protocol : ' + str(protocol) + ' Source Address : ' + str(
                        s_addr) + ' Destination Address : ' + str(d_addr)
                    if str(s_addr) not in self._log:
                        self._log[str(s_addr)] = 1
                    else:
                        self._log[str(s_addr)] += 1
                    tcp_header = packet[iph_length:iph_length + 20]
                    tcph = unpack('!HHLLBBHHH', tcp_header)
                    source_port = tcph[0]
                    dest_port = tcph[1]
                    sequence = tcph[2]
                    acknowledgement = tcph[3]
                    doff_reserved = tcph[4]
                    tcph_length = doff_reserved >> 4
                    print 'Source Port : ' + str(source_port) + ' Dest Port : ' + str(dest_port) + ' Sequence Number : ' + str(
                        sequence) + ' Acknowledgement : ' + str(acknowledgement) + ' TCP header length : ' + str(tcph_length)
                    h_size = iph_length + tcph_length * 4
                    data_size = len(packet) - h_size
                    data = packet[h_size:]
                    print 'Data : ' + data
                except Exception as err:
                    print '###########################'
                    print err
                    print '###########################'
                    continue

    @classmethod
    def station(cls, sub):
        Type = cls.__Type__(sub)
        args = cls.__args__(sub)
        try:
            cap = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
            cap.bind((args[0], int(args[1])))
            while True:
                print cap.listen(5)
        except Exception as err:
            print err
            raw_input(',,')
            pass
        return 0

    def __Type__(self):
        return self._Type

    def __args__(self):
        return self._args


if __debug__:
    print '\n'
    print '                                                 LOGGING PACKETS                                               '
    g = 1
    if g == 2:
        res = Anthena(Type='None', args=(raw_input('enter Host:'), raw_input('enter port:')))
        Trance = Anthena.station(res)
    elif g == 1:
        res = Anthena()
        res.local()
    else:
        exit()


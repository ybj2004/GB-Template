import sys

fileH = open('%s.ind' % (sys.argv[1]), 'r')
content = fileH.read()
fileH.close()

fileH = open('%s.ind' % (sys.argv[1]), 'w')
fileH.write(content.replace('90', '.').replace('\\hyperpage', ''))
fileH.close()

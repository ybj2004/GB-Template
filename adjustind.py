import sys

fileH = open('%s.ind' % (sys.argv[1]), 'r', encoding='utf-8')
content = fileH.read()
fileH.close()

fileH = open('%s.ind' % (sys.argv[1]), 'w', encoding='utf-8')
fileH.write(content.replace('90', '.').replace('\\hyperpage', ''))
fileH.close()

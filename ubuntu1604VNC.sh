# #################################################################
# �ű����� : ubuntu1604VNC
# �ű����� : �Զ���װ���ú��Զ�����X11Vnc            
# ��д���� : 2016.6.13
# ��    �� : longhr 
# ������վ : blog.csdn.net/longhr
# ����汾 : 0.1
# ע����� ������5���ڻ�����
# �������� : ʹ�����ɣ�����Ը� 
# #################################################################

# ���� 1 - ��װ X11VNC  
# ################################################################# 
sudo apt-get install x11vnc -y

# ���� 2 - ���÷�������
# ################################################################# 

sudo x11vnc -storepasswd /etc/x11vnc.pass 


# ���� 3 - ��������
# ################################################################# 

cat > /lib/systemd/system/x11vnc.service << EOF
[Unit]
Description=Start x11vnc at startup.
After=multi-user.target

[Service]
Type=simple
ExecStart=/usr/bin/x11vnc -auth guess -forever -loop -noxdamage -repeat -rfbauth /etc/x11vnc.pass -rfbport 5900 -shared

[Install]
WantedBy=multi-user.target
EOF

# ���� 4 - ���ú���������
# ################################################################ 

echo "Configure Services"
sudo systemctl enable x11vnc.service
sudo systemctl daemon-reload

# ���� 5 - ����
# ################################################################ 
sleep  5s
sudo shutdown -r now 



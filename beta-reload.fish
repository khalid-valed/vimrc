function beta-reload
        sudo kill -9 (cat /home/ec2-user/beta/logs/server.pid)
    sudo php /home/ec2-user/beta/index.php
end

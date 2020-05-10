result=$(flutter analyze)
if [ $? -ne 0 ]; then
    echo "$result" | grep -E 'error.+\.dart:\d+:\d+'
    if [ $? -eq 0 ]; then
        echo "$result"
        exit 1
    fi
fi
echo "$result" > flutter_analyze_report.txt
echo "$result"
exit 0

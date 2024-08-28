import datalad.api as dl
import datetime as date

print(f"### Tested on {date.datetime.now().isoformat(timespec='seconds')}")
print("")
print(dl.configuration("get", ["user.name", "user.email"]))
print("")
print(dl.wtf(sensitive=["python"]))

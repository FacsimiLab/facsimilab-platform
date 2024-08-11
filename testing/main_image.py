import datalad.api as dl

print(dl.configuration("get", ["user.name", "user.email"]))

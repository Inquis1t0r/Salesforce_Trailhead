SELECT CONCAT(Contact_core.CustomerId, "_Mobile") as PhoneId,
    Contact_core.CustomerId as CustomerId,
    Contact_core.MobilePhone as PhoneNumber,
    "Mobile" as PhoneType
FROM Contact_core
WHERE ISNOTNULL(Contact_core.MobilePhone) AND Contact_core.MobilePhone <> ""
UNION
SELECT CONCAT(Contact_core.CustomerId, "_Home") as PhoneId,
    Contact_core.CustomerId as CustomerId, Contact_core.HomePhone as PhoneNumber,
    "Home" as PhoneType
FROM Contact_core
WHERE ISNOTNULL(Contact_core.HomePhone) AND Contact_core.HomePhone <> ""
UNION
SELECT CONCAT(Contact_core.CustomerId, "_Work") as PhoneId,
    Contact_core.CustomerId as CustomerId,
    Contact_core.WorkPhone as PhoneNumber,
    "Work" as PhoneType
FROM Contact_core
WHERE ISNOTNULL(Contact_core.WorkPhone) AND Contact_core.WorkPhone <> ""

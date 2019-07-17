# nodes
## doctor nodes
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/larrycheng/Medical-KG/master/data/doctor-nodes.csv" AS n
CREATE (d:Doctor {doctor_id:n.doctor_id,name:n.name,  sex:n.sex, level:n.doctor_level, type:n.doctor_type, area:n.working_area, title:n.working_title})

# nurse nodes
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/larrycheng/Medical-KG/master/data/nurse-nodes.csv" AS n
CREATE (d:Nurse {nurse_id:n.nurse_id,name:n.name,  sex:n.sex, code:n.working_code})

## AdminOrg nodes
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/larrycheng/Medical-KG/master/data/administration-org-nodes.csv" AS n
CREATE (d:AdminOrg {org_id:n.org_id,name:n.name,  district:n.district, addr:n.addr, phone:n.phone})

# relationships
## doctor publishedBy relationships
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/larrycheng/Medical-KG/master/data/doctor-publishedBy-relationships.csv" AS r
MATCH (h:Doctor {name:r.doctor})
MATCH (t:AdminOrg {name:r.publish_org})
CREATE (h)-[:publishedBy]->(t)

## nurse publishedBy relationships
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/larrycheng/Medical-KG/master/data/nurse-publishedBy-relationships.csv" AS r
MATCH (h:Nurse {name:r.nurse})
MATCH (t:AdminOrg {name:r.publish_org})
CREATE (h)-[:publishedBy {publish_date:r.publish_date}]->(t)
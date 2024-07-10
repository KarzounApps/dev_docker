#!/bin/bash

# Copy the 'tiledesk-db' directory from the host to the MongoDB container under the path '/tiledesk_db_dump'
docker cp tiledesk-db octobot-mongo:/tiledesk_db_dump

# Copy the 'chat21-db' directory from the host to the MongoDB container under the path '/chat21_db_dump'
docker cp chat21-db octobot-mongo:/chat21_db_dump

# # Copy the 'config-db' directory from the host to the MongoDB container under the path '/config_db_dump'
# docker cp config-db octobot-mongo:/config_db_dump

# # Copy the 'admin-db' directory from the host to the MongoDB container under the path '/admin_db_dump'
# docker cp admin-db octobot-mongo:/admin_db_dump

# # Copy the 'local-db' directory from the host to the MongoDB container under the path '/local_db_dump'
# docker cp local-db octobot-mongo:/local_db_dump

# Execute the 'mongorestore' command inside the MongoDB container to restore the 'tiledesk' database
docker exec -it octobot-mongo bash -c "mongorestore --db tiledesk /tiledesk_db_dump"

# Execute the 'mongorestore' command inside the MongoDB container to restore the 'chat21' database
docker exec -it octobot-mongo bash -c "mongorestore --db chat21 /chat21_db_dump"

# # Execute the 'mongorestore' command inside the MongoDB container to restore the 'config' database
# docker exec -it octobot-mongo bash -c "mongorestore --db config /config_db_dump"

# # Execute the 'mongorestore' command inside the MongoDB container to restore the 'admin' database
# docker exec -it octobot-mongo bash -c "mongorestore --db admin /admin_db_dump"

# # Execute the 'mongorestore' command inside the MongoDB container to restore the 'local' database
# docker exec -it octobot-mongo bash -c "mongorestore --db local /local_db_dump"

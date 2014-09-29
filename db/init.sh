echo "DROP DATABASE shibuya_development"
echo "CREATE DATABASE shibuya_development"
echo "Create tables..."
mysql -u root < schema.sql
echo "Insert seeds..."
mysql -u root < seed.sql

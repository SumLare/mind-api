class AddSearchIndexes < ActiveRecord::Migration[5.2]
  def up
    execute "CREATE EXTENSION pg_trgm;
      CREATE INDEX index_users_full_name ON users using gin ((first_name || ' ' || last_name) gin_trgm_ops);
      CREATE INDEX index_questions_content ON questions using gin (content gin_trgm_ops)"
  end

  def down
    execute "DROP INDEX index_users_full_name;
      DROP INDEX index_questions_content;
      DROP EXTENSION pg_trgm;"
  end
end

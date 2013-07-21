class RemoveQueueClassic < ActiveRecord::Migration
  def change
  	execute "DROP FUNCTION IF EXISTS lock_head(tname varchar);
  	DROP FUNCTION IF EXISTS lock_head(q_name varchar, top_boundary integer);
  	DROP FUNCTION IF EXISTS queue_classic_notify() cascade;"
  	drop_table :queue_classic_jobs
  end
end

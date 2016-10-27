defmodule PhoenixBlog.TwitterFollowerStatusController do
  use PhoenixBlog.Web, :controller

  def index(conn, _params) do

    #GETパラメータを取得
    account_list = String.split(_parms["accounts"], ",")

    prepared_statement_list = Enum.map(account_list, fn(x) ->
      prepared_statement_list = prepared_statement_list ++ ["?"]
    end)

    prepared_statement_in = Enum.join(prepared_statement_list, ",")

    {:ok, twitter_status} = EctoAdapters.SQL.query(Repo,
    "SELECT b.twitter_account, follower, updated_at
    from twitter_statuses, (
       SELECT id, twitter_account FROM bases where twitter_account IN (#{prepared_statement_in})
    ) b
    where twitter_statuses.bases_id = b.id order by updated_at desc", account_list)

    dict = HashDict.new
    dict = List.foldr(twitter_status[:rows], dict,
    fn(x,acc) ->
      [twitter_account, follower, updated_at] = x
      check = HashDict.put(acc, twitter_account, %{:follower => follower, :updated_at => UnixTime.convert_date_to_unixtime(updated_at)})
    end)

    render conn, msg: dict
  end
end

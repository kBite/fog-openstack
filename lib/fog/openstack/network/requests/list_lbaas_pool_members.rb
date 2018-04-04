module Fog
  module OpenStack
    class Network
      class Real
        def list_lbaas_pool_members(pool_id, filters = {})
          request(
            expects: 200,
            method: 'GET',
            path: "lbaas/pools/#{pool_id}/members",
            query: filters
          )
        end
      end

      class Mock
        def list_lbaas_pool_members(_pool_id, _filters = {})
          Excon::Response.new(
            body: { 'members' => data[:lbaas_pool_members].values },
            status: 200
          )
        end
      end
    end
  end
end

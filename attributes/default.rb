default['audit']['fetcher'] = 'chef-server'
default['audit']['reporter'] = 'chef-server-automate'

case node['os']
when 'linux'
  if node['platform_family'] == 'rhel'
    node.override['audit']['profiles'] = [ {"name" => "linux-baseline", "compliance" => "admin/cis-rhel7-level1-server"}]
  end
when 'windows'
    node.override['audit']['profiles'] = [ {"name" => "windows-baseline", "compliance" => "admin/cis-windows2012r2-level1-memberserver"}]
end

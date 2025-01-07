function get_cache_size
  set cache_dir "/data/data/com.termux/cache/apt/archives"
  set cache_size (du -sh "$cache_dir" 2>/dev/null | cut -f1)
  
  if test -n "$cache_size"
    echo "Cache size: $cache_size"
  else
    echo "Cache size: 0B"
  end
end

function __fish_pkg_filter_output
    awk -F'/' '{print $1}' | grep -v '^Listing'
end

function __fish_pkg_packages
    pkg list-all 2>/dev/null | __fish_pkg_filter_output
end

function __fish_pkg_installed_packages
    pkg list-installed 2>/dev/null | __fish_pkg_filter_output
end

function __fish_pkg_commands
  echo -e "install\tinstall specified packages"
  echo -e "upgrade\tUpgrade all installed packages"
  echo -e "update\tUpdate package manager databases"
  echo -e "search\tSearch packages by query"
  echo -e "uninstall\tUninstall specified packages"
  echo -e "autoclean\tRemove outdated packages from the cache"
  echo -e "clean\tRemove all packages from cache. "(get_cache_size)
  echo -e "files\tShow all files installed by packages"
  echo -e "list-all\tlist all packages available in repositories"
  echo -e "list-installed\tList installed packages"
  echo -e "reinstall\tReinstall specified packages"
end

complete -c pkg -n "__fish_use_subcommand" -x -a "(__fish_pkg_commands)"
complete -c pkg -l check-mirror -d "Force a re-check of availability of mirrors"
complete -c pkg -n "__fish_seen_subcommand_from install search show" -x -a "(__fish_pkg_packages)"
complete -c pkg -n "__fish_seen_subcommand_from uninstall reinstall files" -x -a "(__fish_pkg_installed_packages)"

#encoding: utf-8

require File.expand_path("../../Abstract/abstract-blackfire-php-extension", __FILE__)

class BlackfirePhp53 < AbstractBlackfirePhpExtension
    init
    homepage "https://blackfire.io"
    version '1.45.0'

    url 'https://packages.blackfire.io/homebrew/blackfire-php_1.45.0-darwin_amd64-php53.tar.gz'
    sha256 '81523d6839d5a90c63d2d477e5c341e97f5455bd3b7018503ee6b2c9761ab4ae'

    def install
        prefix.install "blackfire.so"
        write_config_file
    end

    def config_file
        super + <<~EOS
        blackfire.agent_socket = unix:///usr/local/var/run/blackfire-agent.sock
        ;blackfire.log_level = 3
        ;blackfire.log_file = /tmp/blackfire.log

        ;Sets fine-grained configuration for Probe.
        ;This should be left blank in most cases. For most installs,
        ;the server credentials should only be set in the agent.
        ;blackfire.server_id =

        ;Sets fine-grained configuration for Probe.
        ;This should be left blank in most cases. For most installs,
        ;the server credentials should only be set in the agent.
        ;blackfire.server_token =
        EOS
    end
end

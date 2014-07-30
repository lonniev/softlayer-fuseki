#
# Environment definition for a local Vagrant VM.
#

default_attributes(
  'java' => {
    'install_flavor' => 'oracle',
    'jdk_version' => '7',
    'oracle' => {
      'accept_oracle_download_terms' => true
    }
  },
  'fuseki' => {
	'version' => '1.0.2'
  }
)

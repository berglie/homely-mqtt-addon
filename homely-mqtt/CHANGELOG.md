# Changelog

## [2.0.0] - 2024-01-XX

### Changed
- **BREAKING**: Complete rewrite to follow official Home Assistant addon structure
- Replaced custom run.sh with proper bashio-based initialization
- Updated to use Home Assistant base images
- Improved configuration validation and error handling
- Better logging and debugging information

### Added
- Proper Home Assistant addon structure with rootfs
- bashio utilities for configuration management
- Automatic configuration validation
- Clear error messages for missing required fields
- Proper service management

### Removed
- Custom run.sh script
- Manual environment variable handling
- Old config.json format
- Manual configuration file support

### Technical Details
- Uses `ghcr.io/home-assistant/{arch}-base:3.19` base images
- Implements proper `/etc/cont-init.d/` and `/etc/services.d/` structure
- Configuration automatically read from Home Assistant addon options
- No manual environment variable configuration needed

## [1.0.19] - Previous versions

### Changed
- Initial addon implementation
- Basic MQTT functionality
- Manual configuration handling

## [1.0.18] - Earlier versions

### Changed
- Basic addon structure
- Initial development
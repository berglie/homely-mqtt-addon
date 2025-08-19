# Changelog

## [2.0.1] - 2024-01-XX

### Fixed
- **CRITICAL**: Resolved 404 error during addon installation by changing image reference to local builds
- Fixed Docker image pull issues by using `local/{arch}-addon-homely-mqtt` instead of non-existent `homeassistant/{arch}-addon-homely-mqtt`
- Added local build script (`build.sh`) to create Docker images for all architectures

### Changed
- **BREAKING**: Complete rewrite to follow official Home Assistant addon structure
- Replaced custom run.sh with proper bashio-based initialization
- Updated to use Home Assistant base images
- Improved configuration validation and error handling
- Better logging and debugging information

### Added
- Custom Homely logo and icon (replaced Samba branding)
- Complete TypeScript/Node.js application source code
- Local Docker image building support
- Proper MQTT client with reconnection logic
- Winston logging system
- Comprehensive documentation and installation guides

### Removed
- Custom run.sh script
- Manual environment variable handling
- Old config.json format
- Manual configuration file support
- Old PNG logo files

### Technical Details
- Uses `ghcr.io/home-assistant/{arch}-base:3.19` base images
- Implements proper `/etc/cont-init.d/` and `/etc/services.d/` structure
- Configuration automatically read from Home Assistant addon options
- No manual environment variable configuration needed
- Local image building with `./build.sh` script

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
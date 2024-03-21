# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.2.1] - 2024-03-21

Bugfixes after testing with SmeeFeds and SmeeDoc

### Fixes
- Fix a rare exception during certificate parsing
- Handle invalid (missing) height and width in logos by returning 0x0 dimensions rather than halting
- Catch errors while processing Views. Needs to be improved, but enough for now I hope.

## [0.2.0] - 2024-03-04

This release is mostly bug fixes and performance improvements

### New Features
- Entity Aspects now contain the extra data from Smee Entities, not just XML-derived data, so tags, download times, etc
  can be accessed all from the same aspect struct. 
- The errorURL of roles is now included in SP and IdP aspects
- Contacts now include the REFEDS security subtype in a new field called `rtype`, and `SmeeView.Aspects.Contact.type/1`
  will format this.
- Duplicate entity attributes are merged together and values made unique

### Improvements
- Now uses the improved XML processing in Smee v0.4.0, doubling the speed

### Fixes
- Protocols are now split up properly into aspects, and not one long string of URIs
- IdP and SP roles will no longer share combined lists of services on entities that are both SPs and IdPs
- Compiler warnings have been fixed. 

### Other Changes
- Elixir protocol warnings should be reduced, as definitions have been moved into their own files
- Compatible with Elixir 1.16.0 and OTP 26

## [0.1.0] - 2023-06-05
Initial release


[0.2.1]: https://github.com/Digital-Identity-Labs/smee_view/compare/releases/tag/0.2.0...0.2.1
[0.2.0]: https://github.com/Digital-Identity-Labs/smee_view/compare/releases/tag/0.1.0...0.2.0
[0.1.0]: https://github.com/Digital-Identity-Labs/smee_view/compare/releases/tag/0.1.0

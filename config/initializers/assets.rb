Rails.application.config.assets.version = '1.1'
Rails.application.config.assets.paths << "fonts"
Rails.application.config.assets.precompile += %w( translations.js i18n.js )

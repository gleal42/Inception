<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'gleal' );

/** Database password */
define( 'DB_PASSWORD', 'secret' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */

define('AUTH_KEY',         'u,b^pt.x-4L)h5OHq2|O:dKd&3rWQrO5nDj?JLKbqW(7]o/ZB`>+?2ehw.2nl%ay');
define('SECURE_AUTH_KEY',  'L=^z|hCLOH=!<4xD%ulm;eV+bgfbKjdr}0H>8n@5+w31<h5$S5dn|=p;:b4Ry66+');
define('LOGGED_IN_KEY',    'wxeU,%{l8O6vPHUJ>G$N:~OE{2ZP=V|ss L_,&iS*-M?9_^VfJ;7U@Sh4orC_1nI');
define('NONCE_KEY',        'Zdizu+)tz.r{sJnjJ@JocEcp}q@~Z.n]PS#S,[BfP;KwZ^fnH7GDN|DLy C>E%|h');
define('AUTH_SALT',        '-<:n~Q`@si7R*8-NVtm!V#r-+,w6R_5AQl+&NwfZ<C9ts006hu+:~P&s|I+vF|$~');
define('SECURE_AUTH_SALT', '^Ze.h?TD^`XlIrfwLpEM,NUHfd|j)%x;gr(Vxxz`ZYMPNM}g/w%P.;f`[fL+!+Mm');
define('LOGGED_IN_SALT',   '@!vIu0&pl@]ndN,q42%j56`!{XiP 3@P}2/|y<TS]wbMF<|O-]{ov[%.Uc~|/]ih');
define('NONCE_SALT',       'AjQZLhUq<Ntv#?eLGha|NJfpwMV|aa2a;`<0OX[t&8X]c1RYY=zqARsV$)DWTIkv');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_LOG', '/tmp/wordpress-errors.log' );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

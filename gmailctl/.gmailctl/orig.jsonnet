// Auto-imported filters by 'gmailctl download'.
//
// WARNING: This functionality is experimental. Before making any
// changes, check that no diff is detected with the remote filters by
// using the 'diff' command.

// Uncomment if you want to use the standard library.
// local lib = import 'gmailctl.libsonnet';
local blacklist = import 'blacklist.libsonnet';
{
  version: 'v1alpha3',
  author: {
    name: 'Vittorio Zaccaria',
    email: 'vittorio.zaccaria@gmail.com',
  },
  rules: blacklist.rules + [
    { filter: { subject: '[LISTA PTA]', isEscaped: true }, actions: { archive: true, markRead: true } },
    { filter: { query: 'vito ruscio' }, actions: { labels: ['Acquisto V. Innocenzo'] } },
    { filter: { from: 'mariachiara.molteni@gmail.com' }, actions: { labels: ['Maria Chiara'] } },
    { filter: { and: [{ from: 'chiara' }, { query: 'tenconi' }] }, actions: { labels: ['Chiara'] } },
    { filter: { query: 'pedraglio' }, actions: { labels: ['Acquisto V. Innocenzo'] } },
    { filter: { from: 'info@drdcostruzioni.com' }, actions: { labels: ['Acquisto V. Innocenzo'] } },
    { filter: { from: 'prendin' }, actions: { labels: ['Commercialista'] } },
  ],
}

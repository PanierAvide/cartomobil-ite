const statuses = {
  yes: 'success',
  limited: 'warning',
  unknown: 'yellow accent-4',
  no: 'error'
};

export function colorForStatus(status)  {
  return statuses[status];
}

export function rawColorForStatus(status, theme) {
  const statuses = {
    yes: theme.success,
    limited: theme.warning,
    unknown: '#9E9E9E',
    no: '#212121'
  };
  return statuses[status];
}

const statuses = {
  yes: 'success',
  limited: 'warning',
  unknown: 'yellow accent-4',
  no: 'blue-grey darken-1'
};

export function colorForStatus(status)  {
  return statuses[status];
}

export function rawColorForStatus(status, theme) {
  const statuses = {
    yes: theme.success,
    limited: theme.warning,
    unknown: 'white',
    no: '#9E9E9E'
  };
  return statuses[status];
}

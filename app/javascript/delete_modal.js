// app/javascript/delete_modal.js
export function showDeleteModal(entryId, marker, listItem, map) {
    const modal = document.getElementById('delete-modal');
    const cancelButton = document.getElementById('cancel-delete');
    const confirmButton = document.getElementById('confirm-delete');
    
    // Show the modal
    modal.style.display = 'flex';
    
    // Handle cancel button
    cancelButton.onclick = function() {
      modal.style.display = 'none';
    };
    
    // Handle confirm button
    confirmButton.onclick = function() {
      // Hide the modal
      modal.style.display = 'none';
      
      // Delete the entry
      fetch(`/map_entries/${entryId}`, {
        method: 'DELETE',
        headers: {
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content,
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        }
      })
      .then(response => {
        if (response.ok) {
          return response.json().catch(() => ({}));
        }
        throw new Error('Network response was not ok');
      })
      .then(() => {
        // Remove marker from map
        map.removeLayer(marker);
        
        // Remove list item
        listItem.remove();
        
        // Show success message
        const notice = document.createElement('div');
        notice.className = 'notice';
        notice.style.backgroundColor = '#d4edda';
        notice.style.color = '#155724';
        notice.style.padding = '10px';
        notice.style.marginBottom = '15px';
        notice.style.borderRadius = '4px';
        notice.textContent = 'Entry was successfully deleted.';
        
        document.querySelector('body').insertBefore(notice, document.querySelector('h1'));
        
        // Remove notice after 3 seconds
        setTimeout(() => {
          notice.style.transition = 'opacity 0.5s';
          notice.style.opacity = '0';
          setTimeout(() => {
            notice.remove();
          }, 500);
        }, 2500);
      })
      .catch(error => {
        console.error('Error deleting entry:', error);
        alert('Error deleting entry.');
      });
    };
  }
  
  // Make the function available globally
  window.showDeleteModal = showDeleteModal;
  
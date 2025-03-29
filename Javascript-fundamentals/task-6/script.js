document.addEventListener('DOMContentLoaded', () => {
    const list = document.getElementById('sortable-list');
    let draggedItem = null;
    let touchStartY = 0;
    let touchOffsetY = 0;

    // Add event listeners for both mouse and touch
    document.querySelectorAll('.list-item').forEach(item => {
        // Desktop events
        item.addEventListener('dragstart', handleDragStart);
        item.addEventListener('dragend', handleDragEnd);
        item.addEventListener('dragover', handleDragOver);
        item.addEventListener('dragenter', handleDragEnter);
        item.addEventListener('dragleave', handleDragLeave);
        item.addEventListener('drop', handleDrop);

        // Mobile touch events
        item.addEventListener('touchstart', handleTouchStart, { passive: false });
        item.addEventListener('touchmove', handleTouchMove, { passive: false });
        item.addEventListener('touchend', handleTouchEnd);
    });

    // Desktop event handlers

    // When user starts dragging an item
    function handleDragStart(e) {
        draggedItem = this;
        this.classList.add('dragging');
        e.dataTransfer.effectAllowed = 'move';
        e.dataTransfer.setData('text/html', this.innerHTML);
    }
    
    // When user stops dragging an item and leaves mouse hold
    function handleDragEnd(e) {
        this.classList.remove('dragging');
        draggedItem = null;
    }

    // When user drags an item over another item
    function handleDragOver(e) {
        e.preventDefault();
        e.dataTransfer.dropEffect = 'move';
    }

    // When dragged item comes above an item
    function handleDragEnter(e) {
        this.classList.add('over');
    }

    // When dragged item leaves an item (moves away)
    function handleDragLeave(e) {
        this.classList.remove('over');
    }

    // When dragged item is dropped on another item
    function handleDrop(e) {
        e.preventDefault();
        this.classList.remove('over');
        if(draggedItem !== this) {
            insertAfterDraggedItem(this);
        }
    }

    // Mobile event handlers
    function handleTouchStart(e) {
        e.preventDefault();
        draggedItem = this;
        touchStartY = e.touches[0].clientY;
        touchOffsetY = touchStartY - this.getBoundingClientRect().top;
        this.classList.add('dragging');
    }

    function handleTouchMove(e) {
        if(!draggedItem) return;
        e.preventDefault();

        const touch = e.touches[0];
        const currentY = touch.clientY - touchOffsetY;
        const elements = document.elementsFromPoint(touch.clientX, touch.clientY);

        const targetItem = elements.find(el => el.classList.contains('list-item') && el !== draggedItem);

        if(targetItem) {
            const targetRect = targetItem.getBoundingClientRect();
            const targetMiddleY = targetRect.top + targetRect.height / 2;

            targetItem.classList.add('over');
            if(currentY > targetMiddleY) {
                insertAfterDraggedItem(targetItem);
            } else {
                insertBeforeDraggedItem(targetItem);
            }
        }
    }

    function handleTouchEnd(e) {
        if(draggedItem) {
            draggedItem.classList.remove('dragging');
            document.querySelectorAll('.list-item').forEach(item => {
                item.classList.remove('over');
            });
            draggedItem = null;
        }
    }

    function insertAfterDraggedItem(target) {
        const targetRect = target.getBoundingClientRect();
        const draggedRect = draggedItem.getBoundingClientRect();
        
        if (draggedRect.top < targetRect.top) {
            target.parentNode.insertBefore(draggedItem, target.nextSibling);
        } else {
            target.parentNode.insertBefore(draggedItem, target);
        }
    }

    function insertBeforeDraggedItem(target) {
        target.parentNode.insertBefore(draggedItem, target);
    }
})